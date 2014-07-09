Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4kf3-0004gx-1L
 for ath10k@lists.infradead.org; Wed, 09 Jul 2014 05:43:21 +0000
Received: by mail-ob0-f180.google.com with SMTP id vb8so7603127obc.11
 for <ath10k@lists.infradead.org>; Tue, 08 Jul 2014 22:42:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACKGw+HAsUHk2u5MF_cOzi-J+krv67VJeyCUtBeKaqwaMHGRdQ@mail.gmail.com>
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
 <CA+BoTQk_YtrHrR6Wi3mMAZxT6EHFBxdUAafp48GqfUcM=HwfZg@mail.gmail.com>
 <CABnBrYXn0T=bW45zR5VivFRhP4BqFswYY93hrjB7rx+azKX9uA@mail.gmail.com>
 <CABnBrYUTKdvUiDha3meiiu08BCqNVBuCgXb7M_Gr4DwhyON3qw@mail.gmail.com>
 <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
 <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
 <CABnBrYVANG1cwC8ixD0hGY5guaB3XTP=PAxsf4OfVuZw+iLMaA@mail.gmail.com>
 <CABnBrYUz7Wp0aKkBX8JVFUjOdoZV6gss3x2yMRVwO9WhuH26+Q@mail.gmail.com>
 <CALhHN=rHKJS_FHG1yLhdR_JiUG6_T_q8u3RT1vgtzCdJVXbARQ@mail.gmail.com>
 <CALhHN=pUG+wvvgLe+8mxJ8obE-uBGAk8WEbh0HoGpUrzxi_MpQ@mail.gmail.com>
 <CACKGw+HAsUHk2u5MF_cOzi-J+krv67VJeyCUtBeKaqwaMHGRdQ@mail.gmail.com>
Date: Tue, 8 Jul 2014 22:42:55 -0700
Message-ID: <CABnBrYX+8uaPPvJsoUhjMOy45F+7Z-isXJkVyc-b9-J5Tb2FGA@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Denton Gentry <denton.gentry@gmail.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Jul 8, 2014 at 3:59 AM, Bartosz Markowski
<bartosz.markowski@tieto.com> wrote:
> On 8 July 2014 09:02, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>
> [...]
>
>> BTW, when AP (ath10k) send TCP ACK - are this packets also AMSDU?
>> I see in my case AP can send 3 x A-MSDU (with total size 304 bytes)
>> small frames aggregated. Maybe your HW have problems with that.
>
> @Denton - could you please try to apply this patch -->
> http://permalink.gmane.org/gmane.linux.kernel.wireless.general/124128
> (adds debugfs entires so you can manually configure ampdu/amsdu
> settings) and check whether setting the amsdu to 1 will bypass the
> problem (gets rid of aggregated TCP ACKs)
>
> echo "1 64" > htt_max_amsdu_ampdu

I applied the patch and used echo "1 64" >
/sys/.../htt_max_amsdu_ampdu. It did not improve the throughput of the
802.11ac MacBook Air.

Even without applying this patch, the sniffer trace does not show the
TCP ACKs going back to the MacBook being aggregated as A-MSDU. They
are either individual frames or A-MPDU.


> As Janusz wrote ath10k has enabled checksum offloads, so we do not
> think the retransmissions you noticed, by sniffing via ath10k device,
> are due to the CRC erorrs.
>
>> As I remember correctly someone some time ago report problems with
>> MacBook pro retina but I am not sure this is the same, while no one
>> tests the fix.
>
> This is it: http://lists.infradead.org/pipermail/ath10k/2014-May/001917.html.
> We checked that time and got a hint from firmware guys there was an
> IOT problem with amsdu 3 setting in our AP with BRCM sta. Can follow
> up on this if that's the case here also.
>
> -Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
