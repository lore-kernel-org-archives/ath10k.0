Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biPm2-0005kV-Ab
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 17:39:35 +0000
Received: by mail-oi0-x22d.google.com with SMTP id m11so154538754oif.1
 for <ath10k@lists.infradead.org>; Fri, 09 Sep 2016 10:39:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 9 Sep 2016 10:39:11 -0700
Message-ID: <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

It's just in OTP? You should be able to read the OTP data without
needing a STA/AP up?


-a


On 9 September 2016 at 10:35, Marty Faltesek <mfaltesek@google.com> wrote:
> Is there a way to access calibration data without having to start an
> AP (or client)?
>
> Thanks,
>
> Marty
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
