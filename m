Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8V4O-0002MN-1v
 for ath10k@lists.infradead.org; Wed, 29 Jan 2014 13:20:44 +0000
Received: by mail-la0-f43.google.com with SMTP id pv20so1455399lab.16
 for <ath10k@lists.infradead.org>; Wed, 29 Jan 2014 05:20:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ppnbdj6j.fsf@kamboji.qca.qualcomm.com>
References: <1390999696-8895-1-git-send-email-marek.puzyniak@tieto.com>
 <87ppnbdj6j.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 29 Jan 2014 14:20:13 +0100
Message-ID: <CADnKcVg7i1r0X6_QSA-K2666QsaHDqZ=fJqFo2OM3bs-Mz6n3g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: configure access category for arp
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On 29 January 2014 14:14, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Marek Puzyniak <marek.puzyniak@tieto.com> writes:
>
>> ARP frames exchange does not work properly for UAPSD enabled AP.
>> ARP requests which arrives with access category 0 are processed
>> by network stack and send back with access category 0. FW changes
>> access category to 6. This is causing problems when UAPSD associated
>> STA is sleeping after has sent ARP request. Configure ARP access
>> category in FW to best effort (0) solves this problem. ARP frames
>> will be send with access category 0.
>>
>> Simplify arp ac override functionality by removing redundant entry in
>> pdev param maping table. There should be only one entry in pdev param
>> map but enum has different name for different FW.
>>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> I had a conflict when I applied this to ath-next-test. Please check that
> I didn't break anything:
>
> https://github.com/kvalo/ath/commit/2e006642b3aad6a5fb91f9e560a2bbcdf74aa049
It looks ok.
>
>> +     ret = ath10k_wmi_pdev_set_param(ar,
>> +                                     ar->wmi.pdev_param->arp_ac_override, 0);
>> +     if (ret) {
>> +             ath10k_warn("could not init WMI_PDEV_PARAM_ARP_AC_OVERRIDE (%d)\n",
>> +                         ret);
>
> I also modified this warning message to follow the style used elsewhere
> in the driver.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
