Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur04on062b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::62b]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWncP-0003ci-7W
 for ath10k@lists.infradead.org; Tue, 11 Dec 2018 19:22:58 +0000
From: Peter Oh <peter.oh@bowerswilkins.com>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
Date: Tue, 11 Dec 2018 19:22:38 +0000
Message-ID: <6a59f346-5c9b-190c-feef-39393d17933b@bowerswilkins.com>
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
In-Reply-To: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
Content-Language: en-US
Content-ID: <7EED4595D1C9BF4DB0B027139814A88F@eurprd04.prod.outlook.com>
MIME-Version: 1.0
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Zhi Chen <zhichen@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



On 12/10/2018 08:56 PM, Pradeep Kumar Chitrapu wrote:
> From: Pradeep kumar Chitrapu <pradeepc@codeaurora.org>
>
> Invalid rate code is sent to firmware when multicast rate value of 0 is
> sent to driver indicating disabled case, causing broken mesh path.
> so fix that.
>
> Tested on QCA9984 with firmware 10.4-3.6.1-00827
>
Test data is too small. You need to provide at least QCA9880 and QCA4019 
data together which share ath10k for mesh.

Thanks,
Peter
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
