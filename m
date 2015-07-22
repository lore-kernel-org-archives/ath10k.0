Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHvPG-0004yL-4G
 for ath10k@lists.infradead.org; Wed, 22 Jul 2015 14:54:02 +0000
Received: by lbbzr7 with SMTP id zr7so138498809lbb.1
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2015 07:53:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkw-DUBMxN1hSC+TRPqQ8BniFytAWRupag6Lr6wqD63Pw@mail.gmail.com>
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
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Jul 2015 16:53:18 +0200
Message-ID: <CAFBinCDk_25SwWEMLSX=Nkm1_g3WB3uvkYZkr9tj=mqCsHfrbg@mail.gmail.com>
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

On Wed, Jul 22, 2015 at 9:47 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Note: It's better to post trace.dat. It contains more useful data -
> `trace-cmd report` doesn't decode, e.g. hexdumps unless you have extra
> plugins.
OK, noted. Do you still need trace.dat (I forgot to save that, but I
can obtain a new trace if required)?

> Anyway, I'm running out of ideas. You could make ath10k ignore SWBA
> events (i.e. not send beacon commands) and see what happens.
First of all: thanks for looking into this!
Can you be a bit more specific regarding ignoring SWBA events? Can I
simply make ath10k_wmi_event_host_swba a no-op?


Regards,
Martin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
