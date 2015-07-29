Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKNVz-00071F-Qz
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 09:19:08 +0000
Received: by lbbst4 with SMTP id st4so2517666lbb.1
 for <ath10k@lists.infradead.org>; Wed, 29 Jul 2015 02:18:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmNKME05Y-E=7Sy94govwR1CLa3PQL6izc4KTvnBcB=uA@mail.gmail.com>
References: <CAFBinCCxWeAwpAU2Qjh3RbLX3YGxDUiVoiaTk-WEhySj6OvxFw@mail.gmail.com>
 <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
 <CAFBinCCymvnL5sTDJJQ6vEZZfchPPG=PeyrXzzt7cPqLJuUBMQ@mail.gmail.com>
 <55A44244.9000109@dd-wrt.com>
 <CA+BoTQn5rERqGT-vUKGV=Bs-rMYzx2132+BDGLTmQpWK=DJW7g@mail.gmail.com>
 <55A4E1FC.9000005@dd-wrt.com>
 <CA+BoTQkOeLarxTcOR=aeFoixP-41Jri72gM5MRqUQdNhbQoXOg@mail.gmail.com>
 <CAFBinCBN53s=wHf6428iaqj9sorQCz7XbGiT+UrhWtiYvUGH7g@mail.gmail.com>
 <CA+BoTQnhxJCt1eiUrE68PNawf5FYh96oK1o=517_UY6cE1bOjw@mail.gmail.com>
 <CAFBinCDfZZdTBJL_WcmtTVMha94SAktOF9u2-jmUvW_eces9XA@mail.gmail.com>
 <CAFBinCBWQrf0k0vm_J68d2QdaFqWjxtEEOoqStJAEtXNgPF+tA@mail.gmail.com>
 <CA+BoTQkw-DUBMxN1hSC+TRPqQ8BniFytAWRupag6Lr6wqD63Pw@mail.gmail.com>
 <CAFBinCDk_25SwWEMLSX=Nkm1_g3WB3uvkYZkr9tj=mqCsHfrbg@mail.gmail.com>
 <CA+BoTQnsB5qNVVzcyOR9YGA9sd4Rs+zQ-OeT2Q73YX33gu2NeQ@mail.gmail.com>
 <CAFBinCAk3_zydcTn0HDNeAoN4LntYOM7pDwzf5_z6=j3oKF6UQ@mail.gmail.com>
 <CA+BoTQmNKME05Y-E=7Sy94govwR1CLa3PQL6izc4KTvnBcB=uA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 Jul 2015 11:18:26 +0200
Message-ID: <CAFBinCCwmhmkJgB0EvGZWGiSQXhNESatmP+txmN-7GMJ3bGNGg@mail.gmail.com>
Subject: Re: AP mode firmware crash on QCA9880-BR4A
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On Wed, Jul 29, 2015 at 9:38 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> I can't get smart antenna out of my head at this point - it wasn't
> supported in 10.1 firmware (which works with your device). However
> 10.2 seems to report that your hardware itself isn't capable of it so
> it shouldn't be a problem (in theory).
>
> I guess you could try playing with the WMI_BCN_TX_REF_DEF_ANTENNA in
> the driver and try things like: 0x1, 0x7, 0xf, 0xff, 0xff00, 0xffff,
> 0xff0000, 0xffffff.
I have tested the following values (while there were NO changes in
ath10k_wmi_event_host_swba = my patch was reverted) and it's still
crashing with all of them:
0x1, 0x3, 0x7, 0xf, 0xff, 0xff00, 0xffff, 0xff0000 and 0xffffff

> I doubt it'll help though. I guess other management frames would crash
> firmware as well but I don't think they do. Can you verify that by
> running scan from any station around to see if the ath10k AP responds
> with a Probe Response and is hence visible in station's scan results,
> please?
I did that with my second patch applied (that skips sending beacons)
and WMI_BCN_TX_REF_DEF_ANTENNA = 0. In this case the AP is *not*
visible to other devices (I checked with two android phones, since
those are the only other 5G ready devices I have at the moment).


Regards,
Martin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
