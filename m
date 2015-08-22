Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTDh0-0001YO-D5
 for ath10k@lists.infradead.org; Sat, 22 Aug 2015 18:39:03 +0000
Received: by lbbsx3 with SMTP id sx3so60136190lbb.0
 for <ath10k@lists.infradead.org>; Sat, 22 Aug 2015 11:38:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQm=oBWpLnf0o_CMotQCdjh3kLzSkTuEFUELNfLsfAs3Kw@mail.gmail.com>
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
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Aug 2015 20:38:19 +0200
Message-ID: <CAFBinCC8JtOYK82-QamWAUqpCxcqWUhE0ASTn7QbiV7sUCCwcA@mail.gmail.com>
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

first of all I'd like to say thank you (for helping to solve this issue) :-)

On Mon, Aug 17, 2015 at 7:46 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> I'm out of ideas for now. Apparently the device can Tx as it can send
> out Probe Responses but for some reason it doesn't like beaconing..
Is there anything else we can do? Or do we have to wait for someone
with deeper insight into the firmware (aka a QCA employee)?


Regards,
Martin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
