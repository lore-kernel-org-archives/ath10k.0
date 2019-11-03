Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRHvC-00059F-Rq
 for ath10k@lists.infradead.org; Sun, 03 Nov 2019 15:36:09 +0000
Received: by mail-oi1-x241.google.com with SMTP id l202so12069794oig.1
 for <ath10k@lists.infradead.org>; Sun, 03 Nov 2019 07:36:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8c6d531f6474faf4df55f90185466774@codeaurora.org>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
 <8c6d531f6474faf4df55f90185466774@codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Sun, 3 Nov 2019 16:36:03 +0100
Message-ID: <CAKR_QV+Qh_ErYduYoD8=u_i-y=cbKSJkkajtKxsJ5ML8-Z79EQ@mail.gmail.com>
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
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
To: zhichen@codeaurora.org
Cc: linux-wireless@vger.kernel.org, Peter Oh <peter.oh@eero.com>, ath10k@lists.infradead.org

On 30/10/2019, zhichen@codeaurora.org <zhichen@codeaurora.org> wrote:
> On 2019-10-23 01:16, Peter Oh wrote:
>>
>> How can you say value 0 (I believe it's 64 bytes) DMA burst size
>> causes the symptom and 1 fixes it?
>>
>> Peter
>
> Confirmed from HW team that the configuration controls AXI burst size of
> the RD/WR access to the HOST MEM.
> 0-	No split , RAW read/write transfer size from MAC is put out on bus as
> burst length.
> 1-	Split at 256 byte boundary
> 2,3- Reserved
>
> That's why we see issue with value 0.
>
> Zhi
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

is this true for both wave1 and wave2 ? at least per this commit
message: ath10k: Fix DMA burst size
it's suppose to be:

0 - 128B max (not sure if this means 128B static, or any size between 0 and 128)
1 - 256B

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
