Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmUoa-00076a-0Z
 for ath10k@lists.infradead.org; Mon, 19 May 2014 21:09:44 +0000
Received: by mail-qc0-f169.google.com with SMTP id e16so10094331qcx.14
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 14:09:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw62Msp9p33u_bOGUfSjHrP1t=YZcf=0E3V79-haAUFybw@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAHqTa-3gn1N8hTW4rpMos+h+K4nafoEsv94P0=0O3=Dpiaf2oA@mail.gmail.com>
 <CAA93jw6-Vu5=ySa1Oi6WO1BEo8cuAnKP3FJNJD1P=dEj_-9D3A@mail.gmail.com>
 <CAHqTa-1byQ+UHmREP5+RtikWDj-0wFbDPdPcO+HL0HnH+eDdig@mail.gmail.com>
 <CAJ-Vmo=ODZMM5KRSNC087MqgHBwHT6r1AK49+i3dtJrUtoAi=g@mail.gmail.com>
 <CAA93jw62Msp9p33u_bOGUfSjHrP1t=YZcf=0E3V79-haAUFybw@mail.gmail.com>
Date: Mon, 19 May 2014 14:09:22 -0700
Message-ID: <CAJ-VmomtPNu3wCfZdAzxMcH5TZuJWtTMe+8QTt1OXpVwOF9KYQ@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
From: Adrian Chadd <adrian@freebsd.org>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

On 19 May 2014 14:07, Dave Taht <dave.taht@gmail.com> wrote:
> from what I see from reports on the ath9k list, and openwrt
> I tend to think this problem is endemic, and not driver specific.

I thought the IV for ath10k was handled in the firmware, rather than
setup from the host. I'll have to go digging.



-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
