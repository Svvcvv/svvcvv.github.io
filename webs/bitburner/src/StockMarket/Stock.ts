import { Generic_fromJSON, Generic_toJSON, Reviver } from "../../utils/JSONReviver";
import { getRandomInt } from "../../utils/helpers/getRandomInt";

/**
 * Represents the valuation of a company in the World Stock Exchange.
 */
export class Stock {
    /**
     * Initializes a Stock from a JSON save state
     */
    static fromJSON(value: any): Stock {
        return Generic_fromJSON(Stock, value.data);
    }

    /**
     * Bear or bull (more likely to go up or down, based on otlkMag)
     */
    b: boolean;

    /**
     * Maximum price of a stock (per share)
     */
    readonly cap: number;

    /**
     * Maximum number of shares that player can own (both long and short combined)
     */
    readonly maxShares: number;

    /**
     * Maximum volatility
     */
    readonly mv: number;

    /**
     * Name of the company that the stock is for
     */
    readonly name: string;

    /**
     * Outlook magnitude. Represents the stock's forecast and likelihood
     * of increasing/decreasing (based on whether its in bear or bull mode)
     */
    otlkMag: number;

    /**
     * Average price of stocks that the player owns in the LONG position
     */
    playerAvgPx: number;

    /**
     * Average price of stocks that the player owns in the SHORT position
     */
    playerAvgShortPx: number;

    /**
     * Number of shares the player owns in the LONG position
     */
    playerShares: number;

    /**
     * Number of shares the player owns in the SHORT position
     */
    playerShortShares: number;

    /**
     * The HTML element that displays the stock's info in the UI
     */
    posTxtEl: HTMLElement | null;

    /**
     * Stock's share price
     */
    price: number;

    /**
     * The stock's ticker symbol
     */
    readonly symbol: string;

    /**
     * Total number of shares of this stock
     * This is different than maxShares, as this is like authorized stock while
     * maxShares is outstanding stock.
     */
    readonly totalShares: number;

    constructor(name: string = "",
                symbol: string = "",
                mv: number = 1,
                b: boolean = true,
                otlkMag: number = 0,
                initPrice: number = 10e3,
                marketCap: number = 1e12) {
        this.name               = name;
        this.symbol             = symbol;
        this.price              = initPrice;
        this.playerShares       = 0;
        this.playerAvgPx        = 0;
        this.playerShortShares  = 0;
        this.playerAvgShortPx   = 0;
        this.mv                 = mv;
        this.b                  = b;
        this.otlkMag            = otlkMag;
        this.cap                = getRandomInt(initPrice * 1e3, initPrice * 25e3);

        // Total shares is determined by market cap, and is rounded to nearest 100k
        let totalSharesUnrounded: number = (marketCap / initPrice);
        this.totalShares = Math.round(totalSharesUnrounded / 1e5) * 1e5;

        // Max Shares (Outstanding shares) is a percentage of total shares
        const outstandingSharePercentage: number = 0.2;
        this.maxShares = Math.round((this.totalShares * outstandingSharePercentage) / 1e5) * 1e5;

        this.posTxtEl           = null;
    }

    /**
     * Serialize the Stock to a JSON save state.
     */
    toJSON(): any {
        return Generic_toJSON("Stock", this);
    }
}

Reviver.constructors.Stock = Stock;
