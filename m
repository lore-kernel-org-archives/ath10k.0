Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa6YN-0000TN-Ij
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 17:22:04 +0000
Received: by mail-wi0-f176.google.com with SMTP id hi2so7878061wib.9
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 10:21:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrWC9fXckgUGYWA8AcHT5SoxQc-EouV0U-sFr7v6279oow@mail.gmail.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <2386503.dNPayhXJTQ@wuerfel> <20141003162513.GW26643@leverpostej>
 <2162399.E7Ru1MI0QH@wuerfel>
 <CALCETrWC9fXckgUGYWA8AcHT5SoxQc-EouV0U-sFr7v6279oow@mail.gmail.com>
Date: Fri, 3 Oct 2014 10:21:41 -0700
Message-ID: <CAJ-VmomZzXGBqyQ+xLu1g0hEUfFvnsMoAZrCCfnM9_QfJNwjhg@mail.gmail.com>
Subject: Re: ath10k: calibration data through Device Tree?
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

As far as I'm aware there's no unique identifier in the silicon. It's
all in the OTP or flash.

The NIC comes up with a standard MAC address, the same for all NICs in
the family.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
