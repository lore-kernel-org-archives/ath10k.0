Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d89Hd-0001gs-9i
 for ath10k@lists.infradead.org; Tue, 09 May 2017 17:50:51 +0000
Received: by mail-wr0-x229.google.com with SMTP id z52so9403138wrc.2
 for <ath10k@lists.infradead.org>; Tue, 09 May 2017 10:50:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1863250.VEhGCjvYY0@prime>
References: <20170323133048.30062-2-sw@simonwunderlich.de>
 <1811221.G4Vz0DPyQ8@prime>
 <12133a0e-b030-5b21-8de1-3bf7334d47df@fit.fraunhofer.de>
 <1863250.VEhGCjvYY0@prime>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 9 May 2017 10:50:25 -0700
Message-ID: <CAJ-Vmonxt8BmpL+mM07f4-TLU+LKW+eg1Ri3twcrFOKWp9NXLw@mail.gmail.com>
Subject: Re: [v2,1/3] ath9k: Support channels in licensed bands
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Julian Calaby <julian.calaby@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath9k-devel <ath9k-devel@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Steve deRosier <derosier@gmail.com>, Ben Greear <greearb@candelatech.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Kalle Valo <kvalo@codeaurora.org>

On 9 May 2017 at 05:57, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> Hey Kalle,
>
> it seems like there was some discussion here and I wouldn't expect too many
> more opinions ... do you think we can have a decision based on what has been
> discussed here?

(Note: FreeBSD has had in-tree support for 4.9GHz and 900MHz bands
since forever. I'm actually thinking of extending it to include 5.9
and other UHF bands to cover licenced hardware people are making but
then leaving the support disabled unless you compile in very specific
licenced bits. No, it doesn't work out of the box unless your NIC
actually supports it in the calibration section.)

(Note note: some of those channels have non-megahertz boundaries,
which means ... yeah, hello inter-operability boundaries. Hilarious.)



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
