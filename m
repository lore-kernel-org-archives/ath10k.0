Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e32Ej-0007XT-LT
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 15:50:59 +0000
Received: by mail-wm0-x244.google.com with SMTP id i124so22201849wmf.3
 for <ath10k@lists.infradead.org>; Fri, 13 Oct 2017 08:50:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a80vnrsb.fsf@kamboji.qca.qualcomm.com>
References: <1507068826-14677-1-git-send-email-greearb@candelatech.com>
 <87a80vnrsb.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 13 Oct 2017 08:50:34 -0700
Message-ID: <CAJ-Vmon0SszxH22Zb+O5RVQSommFFuc5XmG+at9=xbGagOb7PQ@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: Retry pci probe on failure.
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "greearb@candelatech.com" <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 13 October 2017 at 05:41, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This works around a problem we see when sometimes the wifi NIC does
>> not respond the first time.  This seems to happen especially often on
>> some of the 9984 NICs in mid-range platforms.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> [...]
>
>> -static int ath10k_pci_probe(struct pci_dev *pdev,
>> -                         const struct pci_device_id *pci_dev)
>> +static int __ath10k_pci_probe(struct pci_dev *pdev,
>> +                           const struct pci_device_id *pci_dev)
>>  {
>>       int ret = 0;
>>       struct ath10k *ar;
>> @@ -3672,6 +3672,22 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>>       return ret;
>>  }
>>
>> +static int ath10k_pci_probe(struct pci_dev *pdev,
>> +                         const struct pci_device_id *pci_dev)
>> +{
>> +     int cnt = 0;
>> +     int rv;
>> +     do {
>> +             rv = __ath10k_pci_probe(pdev, pci_dev);
>> +             if (rv == 0)
>> +                     return rv;
>> +             pr_err("ath10k: failed to probe PCI : %d, retry-count: %d\n", rv, cnt);
>> +             mdelay(10); /* let the ath10k firmware gerbil take a small break */
>> +     } while (cnt++ < 10);
>> +     return rv;
>> +}
>
> This is a sledgehammer approach and it causes reload for all error
> cases, like when hardware is broken or memory allocation is failing.
>
> When the problem happens does it always fail at the the same place? Is
> it hw reset or something else? It's better to retry the invidiual action
> than to do this hack. Or is it just some more delay needed somewhere?

I am seeing WMI timeouts during initial firmware load and wait on
QCA9984 + BCM7444S SoC.
My guess is the WMI wakeup time is not "right" enough and needs to be
extended a little bit.

But then, I have played a lot of whackamole with WMI timeouts during
my loooong porting effort..


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
