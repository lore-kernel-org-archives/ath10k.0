Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOBL9-000831-EP
 for ath10k@lists.infradead.org; Sat, 08 Aug 2015 21:07:40 +0000
Received: by lahi9 with SMTP id i9so7643034lah.2
 for <ath10k@lists.infradead.org>; Sat, 08 Aug 2015 14:07:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkWQKMLEYFbn44uUVdXu8Hi4UHLow4NyiWpFOq1t+t+LQ@mail.gmail.com>
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
 <CAFBinCCwmhmkJgB0EvGZWGiSQXhNESatmP+txmN-7GMJ3bGNGg@mail.gmail.com>
 <CA+BoTQkWQKMLEYFbn44uUVdXu8Hi4UHLow4NyiWpFOq1t+t+LQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Aug 2015 23:06:57 +0200
Message-ID: <CAFBinCBDytyYWhz7i3w1m8b-d3RDLbxWv762o4GdP5J-YzwjjA@mail.gmail.com>
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

Hi Michal,

On Tue, Aug 4, 2015 at 7:19 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> It could be that your devices are not transmitting Probe Requests and
> scan passively 5GHz channels due to their regulatory restrictions. Can
> you try getting traces to confirm this, please?
I have just tried it again and today I *can* see the AP on one of my
Android devices (I haven't tried the second one, but that should also
see it).

During my testing I found out that ath10k_wmi_beacon_send_ref_nowait()
is the command that makes it crash.
I re-enabled everything in ath10k_wmi_event_host_swba() and it started
crashing again.
A few tests later I found that removing the following line "fixes" the
crashes (but it will obviously break other things!):
    arvif->beacon_state = ATH10K_BEACON_SCHEDULED;

Thus I came to the conclusion that I should try disabling
"pdev_send_bcn_cmdid" to the device.

I made two traces (with firmware 10.2.4.70-2), you can find them both
in this tarball: [0]
trace.192.168.1.3:41579.dat was recorded without any ath10k patches
trace.192.168.1.3:43752.dat was recorded with
ath10k_wmi_beacon_send_ref_nowait that has ath10k_wmi_cmd_send_nowait
removed (see [1])


Regards,
Martin


[0] https://dl.dropboxusercontent.com/u/26940713/tmp/ath10k-trace-with-and-without-pdev_send_bcn_cmdid.tar.xz
[1] https://paste.kde.org/pxshmoesw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
