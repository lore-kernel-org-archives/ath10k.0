Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkK16-0002mT-9V
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 23:55:01 +0000
Received: by mail-oi0-x230.google.com with SMTP id q188so46721538oia.3
 for <ath10k@lists.infradead.org>; Wed, 14 Sep 2016 16:54:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvjbhy7b.fsf@kamboji.qca.qualcomm.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
 <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>
 <87lgywjcwi.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>
 <87mvjbhy7b.fsf@kamboji.qca.qualcomm.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Wed, 14 Sep 2016 19:54:37 -0400
Message-ID: <CAOiWkA9xXSc2t9WGTXSvh9KNPDBd1M2ZwEcm-rTMvRVWr0C82Q@mail.gmail.com>
Subject: Re: accessing ath10k calibration data
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I sent out the patch.

I ran into another related issue. Let me explain what we are trying to do:

We want to examine cal_data for a possibly mis-calibrated OTP, and if
so, patch it and store
the result in /tmp (creating a symlink from
/ilb/firmware/ath10k/cal-pci-0001:01:00.0.bin to /tmp).

But ath10k_fetch_cal_file() is only read once at load time, so I've
modified the code to call this function from
ath10k_download_cal_file()
so that the driver catches the modified cal_data. This seems to work
based on the read back of the patched cal_data, but is it the right
approach, or is there a better or cleaner way?

On Wed, Sep 14, 2016 at 1:01 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Marty Faltesek <mfaltesek@google.com> writes:
>
>> OK this does work for me after all. Thanks.
>
> Great.
>
>> I wrote a patch to cache cal_data only while the core is off. I don't
>> need it now, but wondering if there is any benefit
>> to submitting it?
>
> I guess Adrian already answered that :) So please do submit and let's
> take a look at it.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
