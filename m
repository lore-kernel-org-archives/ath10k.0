Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJrP2-0003yW-DU
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 21:57:17 +0000
Received: by mail-qc0-f178.google.com with SMTP id x3so7055757qcv.9
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 14:56:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-0f0CtPhK6M9_oA+nahrEkP9+gqnigYQsUkfWuhLGmkhQ@mail.gmail.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
 <87siktat4d.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmonCMHb9ekiKGsNqpbjar6iWj2souUj0vRpwRkNaadQf1w@mail.gmail.com>
 <CAHqTa-0f0CtPhK6M9_oA+nahrEkP9+gqnigYQsUkfWuhLGmkhQ@mail.gmail.com>
Date: Tue, 19 Aug 2014 14:56:53 -0700
Message-ID: <CAJ-Vmo=q4KgzM76AuAxrMYKSz5anVbv+JMEOknvToshDOE-ziQ@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

Yeah, but you have to be careful to not drop any queued frames or
associated station state. Hence why it's done as a separate vdev,
rather than being done under software channel change control.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
