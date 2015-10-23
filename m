Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zphto-0005QP-Aw
 for ath10k@lists.infradead.org; Fri, 23 Oct 2015 19:21:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA 4x4 board.bin issues.
References: <562A867C.4030901@candelatech.com>
Date: Fri, 23 Oct 2015 22:20:33 +0300
In-Reply-To: <562A867C.4030901@candelatech.com> (Ben Greear's message of "Fri, 
 23 Oct 2015 12:11:56 -0700")
Message-ID: <87fv111jem.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I'm trying to bring up a qca99x0 NIC from Compex, based on CUS239 from what
> I can tell,  on today's ath.git and stock firmware from ath10k-firmware tree.
>
> I tried naming the boardData_AR900B_CUS239_5G_v2_001.bin to board-2.bin
> but it evidently has bad magic.
>
> Should it actually be board-2.bin, or named something differently?

It should be named as board.bin. I haven't uploaded board-2.bin for
QCA99X0 yet, but should do that soon. With board-2.bin everything should
happen just automatically.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
