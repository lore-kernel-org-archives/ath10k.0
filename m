Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZdFP9-0000tK-GT
 for ath10k@lists.infradead.org; Sat, 19 Sep 2015 10:30:04 +0000
Received: by lbpo4 with SMTP id o4so34960322lbp.2
 for <ath10k@lists.infradead.org>; Sat, 19 Sep 2015 03:29:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFBinCC8JtOYK82-QamWAUqpCxcqWUhE0ASTn7QbiV7sUCCwcA@mail.gmail.com>
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
 <CAFBinCBDytyYWhz7i3w1m8b-d3RDLbxWv762o4GdP5J-YzwjjA@mail.gmail.com>
 <CA+BoTQm=oBWpLnf0o_CMotQCdjh3kLzSkTuEFUELNfLsfAs3Kw@mail.gmail.com>
 <CAFBinCC8JtOYK82-QamWAUqpCxcqWUhE0ASTn7QbiV7sUCCwcA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Sep 2015 12:29:20 +0200
Message-ID: <CAFBinCBrByyq76k0Hsc2Ni0LyB6QWzxePUk+G-NVhYgcLBf0aQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, nbd@openwrt.org
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On Sat, Aug 22, 2015 at 8:38 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Is there anything else we can do? Or do we have to wait for someone
> with deeper insight into the firmware (aka a QCA employee)?
I have seen that Felix posted a patch this week: [0] ("ath10k: fix DMA
related firmware crashes on multiple devices").
For what I can say so far this fixes the crashes and firmware
10.2.4.70-2 is now running fine for 10 minutes.

So thanks to everyone who helped investigating and fixing this!


Regards,
Martin


[0] http://lists.infradead.org/pipermail/ath10k/2015-September/006024.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
