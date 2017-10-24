Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e74jn-0001Nt-FI
 for ath10k@lists.infradead.org; Tue, 24 Oct 2017 19:19:46 +0000
Received: by mail-lf0-x22a.google.com with SMTP id g70so25230572lfl.3
 for <ath10k@lists.infradead.org>; Tue, 24 Oct 2017 12:19:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <59EF65AE.8060803@candelatech.com>
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
 <87376dds5e.fsf@kamboji.qca.qualcomm.com>
 <9407ed1f-2bd9-3fd0-981d-1a20452e8ba9@dd-wrt.com>
 <CAGyitvNj+74HafQ9Aps1HTmknTxa0ZUgV7hao1A8mJ4rV7cibw@mail.gmail.com>
 <8760b5cfnz.fsf@kamboji.qca.qualcomm.com> <59EF65AE.8060803@candelatech.com>
From: Jasmine Strong <jas@eero.com>
Date: Tue, 24 Oct 2017 12:19:00 -0700
Message-ID: <CAGyitvOjxws3=pSp6pLH2mwxCC7bcGVFc7GA90+6aH40-AwW7A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

That can't be the case here, since we see it break the mesh too (where
the clients are other QCA radios.)

We're now seeing very slow mesh peering with a 9882 leaf to a 4019
gateway, with the second version of this patch.
It took more than five minutes for one of the leaves to successfully
peer (and the other 9882 leaf, despite achieving
peering, never managed to get DHCP, implying that something is broken
with data frames and this patch on qca9882.)

On Tue, Oct 24, 2017 at 9:09 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 10/23/2017 09:50 PM, Kalle Valo wrote:
>>
>> Jasmine Strong <jas@eero.com> writes:
>>
>>> That's what I saw.  A bcom client was able to associate and not pass
>>> any traffic.  This is on all three of 9882, 9888 and 4019.
>>
>>
>> Thanks for the report, we'll investigate it. And I see that your email
>> was now succesfully delivered to the list:
>>
>> http://lists.infradead.org/pipermail/ath10k/2017-October/010325.html
>
>
>
> I'm not sure if this is helpful or not, but in the transition from 10.1 to
> 10.2 firmware,
> there was some tricky re-work of the PN counter logic in the firmware
> source.  It had
> specific impact on the broadcom driver interaction.
>
> Possibly a similar issue is being seen with this driver patch?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
