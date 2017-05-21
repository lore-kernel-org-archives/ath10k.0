Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCT1R-0005hu-PT
 for ath10k@lists.infradead.org; Sun, 21 May 2017 15:43:59 +0000
Received: by mail-io0-x232.google.com with SMTP id f102so68719523ioi.2
 for <ath10k@lists.infradead.org>; Sun, 21 May 2017 08:43:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a2beca1e-5dfc-5962-cf4b-c39668b6968e@candelatech.com>
References: <CABPxzY+mQ-G6PTsQV9_WVgju4bmQHwxKKW070j7v6=DDgZop4Q@mail.gmail.com>
 <b830b657-3f73-de7f-d61c-1565dc14c2ef@candelatech.com>
 <CABPxzY+Y3Jcxw9UitytgrFS1H53pT7mCvVSbFM0qoj74x4gdFg@mail.gmail.com>
 <CABPxzY+bnfV-z=J=Tz7HH_8PQ1kW-XDpDhEZnqQK6DV_mGfaDg@mail.gmail.com>
 <a2beca1e-5dfc-5962-cf4b-c39668b6968e@candelatech.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Sun, 21 May 2017 21:13:16 +0530
Message-ID: <CABPxzYJJ5qXix7OYVFq3K+w+SukA9fqPuQt-w8ULAZkgt9uppQ@mail.gmail.com>
Subject: Re: ath10k: controlling TX aggregation
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Sun, May 21, 2017 at 8:36 PM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 05/20/2017 09:21 AM, Krishna Chaitanya wrote:
>>
>> On Mon, May 15, 2017 at 3:02 PM, Krishna Chaitanya
>> <chaitanya.mgit@gmail.com> wrote:
>>>
>>> On Fri, May 12, 2017 at 8:15 PM, Ben Greear <greearb@candelatech.com>
>>> wrote:
>>>>
>>>> What chipset, and what firmware version?
>>>>
>>>> Thanks,
>>>> Ben
>>>
>>>
>>> Hi Ben,
>>>
>>> I have missed your response. PFB details.
>>>
>>>  chip: QCA986x/988x PCIe
>>>  FW ver: 10.2.4.70.54 api 5
>>>  kernel: 4.11.0-rc+7 (wireless-drivers-next)
>>>
>> Ben,
>>
>> any clues?
>
>
> I haven't tried that test yet, and use a different
> firmware version.  I did recently work on allowing larger
> AMSDU aggregates and have that working in my CT firmware and
> driver.
ok, so at least its suppose to work.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
