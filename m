Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPh60-0008VT-1U
 for ath10k@lists.infradead.org; Wed, 30 Oct 2019 06:04:41 +0000
Received: by mail-yw1-xc43.google.com with SMTP id x65so459186ywf.12
 for <ath10k@lists.infradead.org>; Tue, 29 Oct 2019 23:04:38 -0700 (PDT)
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
 <CAJ-VmonXbUQ=Gv9fBbpN+ez25c3Pz+xxLoL67etMdC0Q+bwyXg@mail.gmail.com>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <8211c499-ec34-d1de-221e-e037e1fd0332@eero.com>
Date: Tue, 29 Oct 2019 23:04:32 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonXbUQ=Gv9fBbpN+ez25c3Pz+xxLoL67etMdC0Q+bwyXg@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>


On 10/22/19 11:24 AM, Adrian Chadd wrote:
> On Tue, 22 Oct 2019 at 10:17, Peter Oh <peter.oh@eero.com> wrote:
>>
>> On 10/22/19 1:57 AM, Zhi Chen wrote:
>>> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
>>> PCIe hung issue was observed on multiple platforms. The issue was reproduced
>>> when DUT was configured as AP and associated with 50+ STAs.
>>>
>>> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
>>> issue happened. It broke PCIe spec and caused PCIe stuck.
Can you elaborate how 64 bytes DMA size breaks PCIe spec?
>> How can you say value 0 (I believe it's 64 bytes) DMA burst size causes
>> the symptom and 1 fixes it?
>
> +1 to this question.
>
> Also, shouldn't the DMA engine be doing what the firmware says? Is the
> firmware/copy engine actually somehow bursting / prefetching across a
> 4K page boundary?
>
> Surely this is something that can be fixed in software/firmware by
> correctly configuring up buffer size/offsets?
>
>
>
> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
