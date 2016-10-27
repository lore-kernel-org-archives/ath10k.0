Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from villa.puc.rediris.es ([2001:720:418:ca00::7])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzhAk-0007vQ-4Y
 for ath10k@lists.infradead.org; Thu, 27 Oct 2016 09:40:40 +0000
Received: from [84.88.62.208] (helo=leo.cttc.es)
 by villa.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jorge.baranda@cttc.es>)
 id 1bzh7r-0004Bl-0Y
 for ath10k@lists.infradead.org; Thu, 27 Oct 2016 11:37:31 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo.cttc.es (Postfix) with ESMTPSA id 1397E1FDBD
 for <ath10k@lists.infradead.org>; Thu, 27 Oct 2016 11:37:30 +0200 (CEST)
Message-ID: <5811CADC.3000600@cttc.es>
Date: Thu, 27 Oct 2016 11:37:32 +0200
From: Jorge Baranda <jorge.baranda@cttc.es>
MIME-Version: 1.0
Subject: MTU size of Ath10k
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Dear all,

I would like to refresh a recent thread back in August about the MTU =

size of ATH10k =

(http://lists.infradead.org/pipermail/ath10k/2016-August/008226.html).
I was trying to play with the mtu size of a ath10k card using 9980 CT =

firmware. It seems it accepts up to a value of 2300 by configuration, =

but practically the limit is 1595 as the thread commented.

Does anyone know who limits the MTU? Driver/firmware? Which is the real =

limit?

Thank you very much in advance for your time and attention,

With kind regards,

-- =

Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
