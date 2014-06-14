Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvrBT-00045q-UF
 for ath10k@lists.infradead.org; Sat, 14 Jun 2014 16:52:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <53905134.8010303@stackframe.org>
 <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
 <5390594F.4070801@stackframe.org>
 <CA+BoTQ=QCNcbWmhEd1vyXDZY1yy0yvz_VSFqnOzOzYGMyxjGJw@mail.gmail.com>
 <5393781C.8090403@stackframe.org>
 <CA+BoTQk8Z-ngkWMX4dLnc6fzLZGbn_bMEYZDcLqsfUVVmf8Hgg@mail.gmail.com>
 <539A015C.2020703@stackframe.org>
 <CA+BoTQ=H0oB+OKFXvvu4MP2s89OaEbwrFgurHavj2BO2Bvu9tQ@mail.gmail.com>
Date: Sat, 14 Jun 2014 19:51:31 +0300
In-Reply-To: <CA+BoTQ=H0oB+OKFXvvu4MP2s89OaEbwrFgurHavj2BO2Bvu9tQ@mail.gmail.com>
 (Michal Kazior's message of "Fri, 13 Jun 2014 13:12:40 +0200")
Message-ID: <874mzn4ep8.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Sven Schnelle <svens@stackframe.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> To recapitulate, can you please check what mac address your wlan interface has:
>
>  b) with otp failure ignored, try board.bin as extracted from the
> calibration mtd partition but firmware-2.bin as found in vanilla
> OpenWRT

I haven't checked this yet, but I assume that when the data from MTD is
used we should not even run otp.bin. It would be good to check that case
as well:

  b) don't run otp.bin at all, try board.bin as extracted from the
 calibration mtd partition but firmware-2.bin as found in vanilla
 OpenWRT

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
