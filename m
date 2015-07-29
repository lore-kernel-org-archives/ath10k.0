Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKErS-0002ye-Nj
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 00:04:44 +0000
Received: by lahh5 with SMTP id h5so78182655lah.2
 for <ath10k@lists.infradead.org>; Tue, 28 Jul 2015 17:04:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnsB5qNVVzcyOR9YGA9sd4Rs+zQ-OeT2Q73YX33gu2NeQ@mail.gmail.com>
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
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 Jul 2015 02:04:00 +0200
Message-ID: <CAFBinCAk3_zydcTn0HDNeAoN4LntYOM7pDwzf5_z6=j3oKF6UQ@mail.gmail.com>
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

sorry for the delay, I was very busy for the past week.
But now I am back with news.
To keep it simple, all of my new findings below are with ath10k
firmware 10.2.4.70-2.
The wireless drivers were also updated in OpenWrt: "Loading modules
backported from Linux version master-2015-07-21-0-g47cd203"

On Thu, Jul 23, 2015 at 7:50 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Yes, this should be enough. You'll want to add/keep a print to know
> how many SWBA event come in though.
I have used this patch [0] to make ath10k_wmi_event_host_swba only do
printk("%s()\n", __func__);
Result: firmware is not crashing - kernel log can be seen here: [1]

> Perhaps not submitting beacons will prevent the crash or it'll postpone it until
> after more SWBA events are delivered than before.
I also tried that by #if 0'ing everything starting at "if
(!arvif->beacon_buf)" until "trace_ath10k_tx_payload(ar, bcn->data,
bcn->len);". The patch for this can be seen here: [2]
The result: firmware is still not crashing - kernel log can be seen here: [3]

Without any patches at all (only a printk at the start of
ath10k_wmi_event_host_swba), this is the result the same as with old
wireless driver versions: firmware crashes, see [5]

Let me know what the next steps are - I'm sure we can fix this nasty bug! :-)


Regards,
Martin

[0] https://paste.kde.org/p7osjjjys
[1] https://paste.kde.org/pevltyu4z
[2] https://paste.kde.org/pexn9n4ao
[3] https://paste.kde.org/pgjf9xv4w
[5] https://paste.kde.org/p2xxmpoiz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
