Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHqZp-0003ed-6b
 for ath10k@lists.infradead.org; Tue, 28 Jun 2016 10:49:12 +0000
Message-ID: <1467110918.2493.9.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] cfg80211: Add support to set tx power for a station
 associated
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 28 Jun 2016 12:48:38 +0200
In-Reply-To: <1465926256-6463-1-git-send-email-arnagara@qti.qualcomm.com>
References: <1465926256-6463-1-git-send-email-arnagara@qti.qualcomm.com>
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: arnagara@codeaurora.org, ath10k@lists.infradead.org

On Tue, 2016-06-14 at 23:14 +0530, Ashok Raj Nagarajan wrote:
> This patch adds support to set transmit power setting type and
> transmit power level attributes to NL80211_CMD_SET_STATION in order
> to facilitate adjusting the transmit power level of a station
> associated to the AP.

Why would you ever need to do that manually? Please give more
explanation in the commit message.

We have minstrel-blues (which never made it into the code, but that's
just because the submitter went away) doing power adjustments, so you
need to explain why this should be necessary.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
