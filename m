Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRhIh-0005z6-Kj
 for ath10k@lists.infradead.org; Mon, 04 Nov 2019 18:42:05 +0000
Received: by mail-pl1-x641.google.com with SMTP id l4so2750837plt.13
 for <ath10k@lists.infradead.org>; Mon, 04 Nov 2019 10:42:02 -0800 (PST)
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
 <8c6d531f6474faf4df55f90185466774@codeaurora.org>
 <CAKR_QV+Qh_ErYduYoD8=u_i-y=cbKSJkkajtKxsJ5ML8-Z79EQ@mail.gmail.com>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <3f3b683f-789a-9b7f-a854-0fdcc20819d1@eero.com>
Date: Mon, 4 Nov 2019 10:41:58 -0800
MIME-Version: 1.0
In-Reply-To: <CAKR_QV+Qh_ErYduYoD8=u_i-y=cbKSJkkajtKxsJ5ML8-Z79EQ@mail.gmail.com>
Content-Language: en-US
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
To: Tom Psyborg <pozega.tomislav@gmail.com>, zhichen@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On 11/3/19 7:36 AM, Tom Psyborg wrote:
> On 30/10/2019, zhichen@codeaurora.org <zhichen@codeaurora.org> wrote:
>> On 2019-10-23 01:16, Peter Oh wrote:
>>> How can you say value 0 (I believe it's 64 bytes) DMA burst size
>>> causes the symptom and 1 fixes it?
>>>
>>> Peter
>> Confirmed from HW team that the configuration controls AXI burst size of
>> the RD/WR access to the HOST MEM.
>> 0-	No split , RAW read/write transfer size from MAC is put out on bus as
>> burst length.
>> 1-	Split at 256 byte boundary
>> 2,3- Reserved
>>
>> That's why we see issue with value 0.
>>
>> Zhi
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
> is this true for both wave1 and wave2 ? at least per this commit
> message: ath10k: Fix DMA burst size
> it's suppose to be:
>
> 0 - 128B max (not sure if this means 128B static, or any size between 0 and 128)
> 1 - 256B
I didn't check other chipsets, but QCA4019 registers say AXI read/write 
burst size is 64 bytes for 0.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
