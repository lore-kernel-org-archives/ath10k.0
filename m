Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eM5lH-0003Ag-Od
 for ath10k@lists.infradead.org; Tue, 05 Dec 2017 05:27:21 +0000
MIME-Version: 1.0
Date: Tue, 05 Dec 2017 10:56:58 +0530
From: akolli@codeaurora.org
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <1512397413.14552.67.camel@sakura.staff.proxad.net>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <1512125137.38490.70.camel@sakura.staff.proxad.net>
 <7792e2fb2c546d8745c65e48945f2535@codeaurora.org>
 <1512140710.38490.81.camel@sakura.staff.proxad.net>
 <45d5ada8ea658e49af85582b4f3f71f7@codeaurora.org>
 <1512397413.14552.67.camel@sakura.staff.proxad.net>
Message-ID: <642ec05b29239335ba748f25e248634b@codeaurora.org>
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
To: mbizon@freebox.fr
Cc: linux-wireless-owner@vger.kernel.org, akolli@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2017-12-04 19:53, Maxime Bizon wrote:
> On Mon, 2017-12-04 at 18:54 +0530, akolli@codeaurora.org wrote:
> 
>> Hope 10.2.4-1.0-00029 Firmware binary works for you.
> 
> it does
> 
>> I will check this warning.
> 
> fixed by applying patch:
>  "[PATCH] ath10k: fix recent bandwidth conversion bug"
> 
> as suggested by Christian Lamparter
> 
> only remaining oddity is the CONFIG_MAC80211_DEBUGFS dependency

I will send a patch to remove this dependency.

Thanks,
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
