Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YF5pr-0005pt-8C
 for ath10k@lists.infradead.org; Sat, 24 Jan 2015 18:53:32 +0000
Received: by mail-ig0-f175.google.com with SMTP id hn18so2600622igb.2
 for <ath10k@lists.infradead.org>; Sat, 24 Jan 2015 10:53:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54C26EB3.7050805@candelatech.com>
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com>
 <54BFF788.2000500@candelatech.com>
 <54C00239.7000008@candelatech.com>
 <54C166B8.7060405@candelatech.com>
 <CA+BoTQmF+z5+HW+=xis7LPSmq6sSxn2ZuiJHGM83dAAftkN_sA@mail.gmail.com>
 <54C26EB3.7050805@candelatech.com>
Date: Sat, 24 Jan 2015 19:53:04 +0100
Message-ID: <CALhHN=oD_R=RvhpAV1wC5kyP02KSU1E5fjyqidbXXx+bMZ9pZQ@mail.gmail.com>
Subject: Re: More than one ath10k NIC will not load (bisected)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 23 January 2015 at 16:54, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 01/22/2015 10:43 PM, Michal Kazior wrote:
>>
>> On 22 January 2015 at 22:08, Ben Greear <greearb@candelatech.com> wrote:
>>>
>>>
>>> On 01/21/2015 11:47 AM, Ben Greear wrote:
>>>>
>>>> On 01/21/2015 11:01 AM, Ben Greear wrote:
>>>>>
>>>>> On 01/20/2015 06:49 PM, Ben Greear wrote:
>>>>>>
>>>>>> On 01/20/2015 06:13 PM, Sebastian Gottschall wrote:
>>>>>>>
>>>>>>> Am 20.01.2015 um 22:53 schrieb Ben Greear:
>>>>>>>>
>>>>>>>> I tried running a patched version of 3.19.0-rc5 kernel, and it seems
>>>>>>>> to work
>>>>>>>> fine when there is one ath10k NIC in the system, but when there is
>>>>>>>> two it
>>>>>>>> doesn't try to load the firmware.
>>>
>>>
>>> Ok, this bisects to this commit.  First (or sometimes second) NIC will
>>> load,
>>> but the other one will not load firmware.  No obvious errors in dmesg.
>>
>>
>> So I'm confused. If it doesn't load firmware then there has to be some
>> error in dmesg. If there are no errors then how come you know it
>> doesn't load firmware? Is it being probed at all?
>>
>>
>>> Platform is x86-64, Fedora 20.  NICS:
>>>
>>> 03:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
>>> Network Adapter
>>> 04:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
>>> Network Adapter
>>>
>>>
>>> 7c0f0e3c9797e5a08d15da68812f24eadaf9e82b is the first bad commit
>>> commit 7c0f0e3c9797e5a08d15da68812f24eadaf9e82b
>>> Author: Michal Kazior <michal.kazior@tieto.com>
>>> Date:   Mon Oct 20 14:14:38 2014 +0200
>>>
>>>      ath10k: mask/unmask msi fw irq
>>>
>>>      This was the final missing bit to making sure the
>>>      device doesn't assert interrupts to host.
>>>
>>>      This should fix possible race when target crashes
>>>      during driver teardown.
>>>
>>>      This also removes an early warm reset workaround
>>>      during pci probing.
>>>
>>>      Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>>      Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>>
>>> :040000 040000 f7ab5ff9f7e3713118dab6f23d02f11003de6fef
>>> fa5cb5ee76bdee2c654fcb8e6b8b1283c225bcc2 M      drivers
>>
>>
>> Hmm.. This removes warm_reset in probe function but I fail to see how
>> this could end up not loading one of the NIC *silently*?
>>
>> Anyway there's a pending patch which adds the reset back:
>>
>> https://github.com/kvalo/ath/commit/bdcd6f4e4ac5d2d2a56da4813f56655e6db0ee45
>> . You might want to try it and see if it helps.
>
>
> Reverting the patch made it work again for me.
>
> I don't understand that code well, but perhaps you are disabling
> a shared interrupt that silently stops the second NIC from
> being able to do it's thing?
>
> Do you have a PC with 2 NICs in it that you could try yourself?
>
I have laptop with 2 ath10k cards (one internal one external), and yes
I had some problems, but that was timeout issue (I am not sure,
reading chip_id), but we fixed this.

> I can grab you the logs of a failure to boot later today.
>
Please send logs.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
