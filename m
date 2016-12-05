Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDuXF-0002oe-M5
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 14:46:30 +0000
Message-ID: <1480949161.31788.23.camel@sipsolutions.net>
Subject: Re: [PATCH 1/4] cfg80211: Add support to enable or disable btcoex
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 05 Dec 2016 15:46:01 +0100
In-Reply-To: <1478610932-21954-2-git-send-email-c_traja@qti.qualcomm.com>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-2-git-send-email-c_traja@qti.qualcomm.com>
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
To: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org
Cc: tamizhchelvam@codeaurora.org, ath10k@lists.infradead.org

On Tue, 2016-11-08 at 18:45 +0530, c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> This patch adds support to enable or disable btcoex by
> adding NL80211_ATTR_WIPHY_BTCOEX_ENABLE attribute in
> NL80211_CMD_SET_WIPHY command. By default BTCOEX disabled in driver.

I think overloading SET_WIPHY even more is a mistake - why not group
this with the new command you're introducing in the second patch?

Also, can have a flag attribute to enable/disable, or better even
disable when you're not setting any other parameters.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
