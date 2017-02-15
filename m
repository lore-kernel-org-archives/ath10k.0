Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cduYt-0005uk-Js
 for ath10k@lists.infradead.org; Wed, 15 Feb 2017 08:03:41 +0000
Message-ID: <1487145795.4026.9.camel@sipsolutions.net>
Subject: Re: [PATCH v3] iw: Add support for controlling tx power for per
 station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 15 Feb 2017 09:03:15 +0100
In-Reply-To: <1486555277-25258-1-git-send-email-arnagara@qti.qualcomm.com>
 (sfid-20170208_131118_350049_87BE682C)
References: <1486555277-25258-1-git-send-email-arnagara@qti.qualcomm.com>
 (sfid-20170208_131118_350049_87BE682C)
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: arnagara@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


> +		sta_txpwr = strtoul(argv[0], &err, 0);

you should error-check this.

> +		NLA_PUT_U32(msg, NL80211_ATTR_STA_TX_POWER,
> sta_txpwr);
> +	}

> +}
> +COMMAND_ALIAS(station, set, "<MAC address> txpwr <auto|limit> [<tx
> power mBm>]",
> 

Seems like that should be

<MAC address> txpwr <auto|limit <tx power dBm>>

or so?

I made that dBm there, doing that and parsing floating point numbers
would be nice I think.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
