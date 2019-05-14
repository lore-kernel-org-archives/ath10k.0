Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQTNt-0002ha-BC
 for ath10k@lists.infradead.org; Tue, 14 May 2019 09:06:06 +0000
Message-ID: <7c92f5cf51eaec1d5449698d90f5b6c5ca6c2bea.camel@sipsolutions.net>
Subject: Re: [PATCH v2] mac80211: remove warning message
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 14 May 2019 11:05:51 +0200
In-Reply-To: <1557824507-17668-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190514_110314_752671_7E53E9A2)
References: <1557824507-17668-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190514_110314_752671_7E53E9A2)
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org

On Tue, 2019-05-14 at 17:01 +0800, Yibo Zhao wrote:
> In multiple SSID cases, it takes time to prepare every AP interface
> to be ready in initializing phase. If a sta already knows everything it
> needs to join one of the APs and sends authentication to the AP which
> is not fully prepared at this point of time, AP's channel context
> could be NULL. As a result, warning message occurs.
> 
Err, what was the point in sending v2 without any changes?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
