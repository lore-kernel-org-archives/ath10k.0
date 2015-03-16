Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway11.websitewelcome.com ([69.56.195.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXbzp-0002N0-Fm
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 20:52:22 +0000
Received: from gator4158.hostgator.com (gator4158.hostgator.com
 [108.167.133.14])
 by gateway11.websitewelcome.com (Postfix) with ESMTP id 5737CAD492166
 for <ath10k@lists.infradead.org>; Mon, 16 Mar 2015 14:51:59 -0600 (CST)
Received: from [64.114.87.10] (port=37114 helo=W7PC)
 by gator4158.hostgator.com with esmtpsa (TLSv1:AES256-SHA:256)
 (Exim 4.82) (envelope-from <mrex@tranzeo.com>) id 1YXbzS-0007JC-II
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 15:51:58 -0500
From: <mrex@tranzeo.com>
Subject: Re: ath10k tx99-like test mode?
Date: Mon, 16 Mar 2015 13:51:56 -0700
Message-ID: <023401d0602b$0b3139a0$2193ace0$@tranzeo.com>
MIME-Version: 1.0
Content-Language: en-ca
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Ben,

The tx99 feature has the benefit of not needing any client or traffic to be
passed for a power meter to measure.=A0 So it=92s incredibly fast to test
different rates and output power than having to wait for client to
re-associate, pass traffic and adjust power meter to duty cycle (depending
on how fancy the meter is).=A0 This is more applicable for calibration and
evaluation than for adaption or protocol testing.

Tx99 is better suited for calibration and FCC certification testing and not
for testing things like adaptive modulation or what happens when mixed
modulations are enabled.=A0 It cuts down on lab certification test time and
complexity (lab engineers test a different wireless widget every day and not
familiar with webGUI=92s and config settings, etc).=A0 Tx99 often was more =
=91raw=92
and didn=92t behave the same as adaptive modulation algorithm, probably more
so with more streams than 1 and 11b/g/n.

So having a feature that can just output raw frames at full duty cycle at a
specific rate and output power without client would be highly beneficial for
lab testing and reduce test time and complexity for radio validation.

Best regards,
Mike


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
