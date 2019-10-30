Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPhTJ-0000vE-4e
 for ath10k@lists.infradead.org; Wed, 30 Oct 2019 06:28:46 +0000
MIME-Version: 1.0
Date: Wed, 30 Oct 2019 14:28:41 +0800
From: zhichen@codeaurora.org
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
In-Reply-To: <CAJ-VmonXbUQ=Gv9fBbpN+ez25c3Pz+xxLoL67etMdC0Q+bwyXg@mail.gmail.com>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
 <CAJ-VmonXbUQ=Gv9fBbpN+ez25c3Pz+xxLoL67etMdC0Q+bwyXg@mail.gmail.com>
Message-ID: <fb2b3b1fc5b3fd00a23e97413777a21e@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Peter Oh <peter.oh@eero.com>, ath10k <ath10k@lists.infradead.org>

On 2019-10-23 02:24, Adrian Chadd wrote:
> On Tue, 22 Oct 2019 at 10:17, Peter Oh <peter.oh@eero.com> wrote:
>> 
>> 
>> On 10/22/19 1:57 AM, Zhi Chen wrote:
>> > This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
>> > PCIe hung issue was observed on multiple platforms. The issue was reproduced
>> > when DUT was configured as AP and associated with 50+ STAs.
>> >
>> > With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
>> > issue happened. It broke PCIe spec and caused PCIe stuck.
>> 
>> How can you say value 0 (I believe it's 64 bytes) DMA burst size 
>> causes
>> the symptom and 1 fixes it?
> 
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
> -Adrian

DMA engine is working as expected as the configuration. It's copy engine 
which actually
splits the RD/WR requests and accesses host memory.
And yes it's platform related configuration. We have never hit this 
issue on x86 platform.


Zhi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
