Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJc4g-00031L-7n
 for ath10k@lists.infradead.org; Fri, 18 May 2018 09:53:26 +0000
Message-ID: <1526637184.3805.14.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: add dynamic vlan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 18 May 2018 11:53:04 +0200
In-Reply-To: <63f12b0c-02e9-0ad2-28a0-d0bbc858e76a@dd-wrt.com>
 (sfid-20180423_211819_362504_0693E2C4)
References: <1524232653-22573-1-git-send-email-mpubbise@codeaurora.org>
 <63f12b0c-02e9-0ad2-28a0-d0bbc858e76a@dd-wrt.com>
 (sfid-20180423_211819_362504_0693E2C4)
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Mon, 2018-04-23 at 21:18 +0200, Sebastian Gottschall wrote:
> this patch makes no sense at some points. AP_VLAN must be enabled always 
> (it is enabled by mac80211 by default, but is now disabled in very 
> latest git version for drivers which announce sw_crypto support)
> if its disabled wds ap / wds sta operation will not work anymore since 
> mac80211 uses AP_VLAN for the local wds sta interfaces

You'd do you well to learn the correct terminology used in Linux if you
try to communicate with us...

What you say there makes no sense, WDS is a separate mode. Maybe you
mean 4-addr mode?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
