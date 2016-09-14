Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bk2KY-0003G8-Bp
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 05:01:55 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: accessing ath10k calibration data
Date: Wed, 14 Sep 2016 05:01:13 +0000
Message-ID: <87mvjbhy7b.fsf@kamboji.qca.qualcomm.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
 <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>
 <87lgywjcwi.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>
In-Reply-To: <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>	(Marty
 Faltesek's message of "Tue, 13 Sep 2016 16:49:36 -0400")
Content-Language: en-US
Content-ID: <D0A5A10C4D27EF4090FDC1E63BDAB826@qualcomm.com>
MIME-Version: 1.0
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marty Faltesek <mfaltesek@google.com> writes:

> OK this does work for me after all. Thanks.

Great.

> I wrote a patch to cache cal_data only while the core is off. I don't
> need it now, but wondering if there is any benefit
> to submitting it?

I guess Adrian already answered that :) So please do submit and let's
take a look at it.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
