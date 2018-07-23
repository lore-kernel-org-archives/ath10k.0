Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fha72-0001Of-JW
 for ath10k@lists.infradead.org; Mon, 23 Jul 2018 12:38:53 +0000
MIME-Version: 1.0
Date: Mon, 23 Jul 2018 18:08:41 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 0/6] *** Add support for wifi QMI client handshakes ***
In-Reply-To: <20180719175105.GA2633@centauri.lan>
References: <20180706085622.27945-1-govinds@codeaurora.org>
 <20180719175105.GA2633@centauri.lan>
Message-ID: <14acf06c481a2fd077ccc0823bd6e046@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

Hi Niklas,

Thanks for the review.

On 2018-07-19 23:21, Niklas Cassel wrote:
> On Fri, Jul 06, 2018 at 02:26:17PM +0530, Govind Singh wrote:
>> Add QMI client handshakes for Q6 integrated WLAN connectivity 
>> subsystem.
>> This module is responsible for communicating WLAN control messages to 
>> FW
>> over QMI interface. This patch series enables the qmi handshakes 
>> required for
>> WCN3990 chipset.
> 
> (cut)
> 
> Hello Govind,
> 
> I ran make W=1, sparse, and checkpatch on your new iteration of 
> patches.
> (I didn't do a full manual review this time, since I did that last 
> time.)
> 
> Building with warnings and checkpatch looks good,
> but sparse reports the two following warnings:
> 
>   CHECK   drivers/net/wireless/ath/ath10k//qmi.c
> drivers/net/wireless/ath/ath10k//qmi.c:935:29: warning: incorrect type
> in assignment (different address spaces)
> drivers/net/wireless/ath/ath10k//qmi.c:935:29:    expected void *msa_va
> drivers/net/wireless/ath/ath10k//qmi.c:935:29:    got void [noderef] 
> <asn:2>*
> 

Fixed in v4 version.

> and
> 
> drivers/net/wireless/ath/ath10k//snoc.c:76:22: warning: incorrect type
> in initializer (different base types)
> drivers/net/wireless/ath/ath10k//snoc.c:76:22:    expected restricted
> __le16 [usertype] reg_offset
> drivers/net/wireless/ath/ath10k//snoc.c:76:22:    got int
> drivers/net/wireless/ath/ath10k//snoc.c:77:19: warning: incorrect type
> in initializer (different base types)
> drivers/net/wireless/ath/ath10k//snoc.c:77:19:    expected restricted
> __le16 [usertype] ce_id
> drivers/net/wireless/ath/ath10k//snoc.c:77:19:    got int
> drivers/net/wireless/ath/ath10k//snoc.c:77:22: warning: incorrect type
> in initializer (different base types)
> drivers/net/wireless/ath/ath10k//snoc.c:77:22:    expected restricted
> __le16 [usertype] reg_offset
> drivers/net/wireless/ath/ath10k//snoc.c:77:22:    got int
> drivers/net/wireless/ath/ath10k//snoc.c:78:19: warning: incorrect type
> in initializer (different base types)
> drivers/net/wireless/ath/ath10k//snoc.c:78:19:    expected restricted

Fixed in v4 version.

Thanks,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
