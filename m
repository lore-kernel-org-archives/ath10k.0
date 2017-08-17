Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x22f.google.com ([2607:f8b0:4002:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diN81-0006ek-MB
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 15:54:39 +0000
Received: by mail-yw0-x22f.google.com with SMTP id p68so43596893ywg.0
 for <ath10k@lists.infradead.org>; Thu, 17 Aug 2017 08:54:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878tii47sx.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
 <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhBEkiRoyO+10ShcU2UDbz3a+zFxKVvxkipvqd2e3B9u3w@mail.gmail.com>
 <87valn5vhs.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhCpWBDv=_rZ_KDTsQ008wjUgv5nix=kxv-RPd2035xGLQ@mail.gmail.com>
 <CAPYrjBUrEuuxpO=KYi1EXh-bZU2sPNLEsnNZnnp6_w1viss3wQ@mail.gmail.com>
 <87pobu4qer.fsf@kamboji.qca.qualcomm.com>
 <CAPYrjBWJ5teJ9SDN0NPEr4Qa=cGvSkbHzLfE=-pyYw=hVgGryA@mail.gmail.com>
 <878tii47sx.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 17 Aug 2017 08:54:15 -0700
Message-ID: <CAJ-Vmo=wzZn10wu74r54N+SC-dY7tq1P6EghPLgHp6A326gUoA@mail.gmail.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I'd rather see the ones that are known-to-be-ok-to-ignore be ignored.
I've been bitten by unhandled firmware IDs that I had to backfill
whilst doing driver bring-up / QSDK patch porting. :-)

(And honestly, if I were to submit a patch, it would be to log the
actual event ID and flags in a way you can grep for it, versus the
above format where the high bits are set to say they're a
notification, etc.)


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
