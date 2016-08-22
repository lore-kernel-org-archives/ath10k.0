Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbn33-0008P1-FR
 for ath10k@lists.infradead.org; Mon, 22 Aug 2016 11:05:46 +0000
Date: Mon, 22 Aug 2016 13:02:14 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: ath10k fail to load firmware
Message-ID: <20160822110214.GB2118@redhat.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <87eg6774my.fsf@kamboji.qca.qualcomm.com>
 <20160822084023.GA2118@redhat.com>
 <87mvk5xfjw.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mvk5xfjw.fsf@kamboji.qca.qualcomm.com>
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
Cc: "Yijun_Shen@Dell.com" <Yijun_Shen@dell.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "perry_yuan@dell.com" <perry_yuan@dell.com>

On Mon, Aug 22, 2016 at 10:29:24AM +0000, Valo, Kalle wrote:
> Stanislaw Gruszka <sgruszka@redhat.com> writes:
> 
> > On Tue, Aug 02, 2016 at 12:10:46PM +0000, Valo, Kalle wrote:
> >> I pushed a new board-2.bin:
> >> 
> >> https://github.com/kvalo/ath10k-firmware/commit/7c0411643b195b246d3871f409f9219f528b39c1
> >
> > Kalle, when do you plan to propagate this to upstream linux-firmware ?
> 
> I usually send firmware updates to linux-firmware in a bigger update. I
> have quite a lot of patches pending so I wasn't planning to do it quite
> not yet.
> 
> Why are you asking, is this urgent?

Well, we want to add support to Dell ath10k devices to our system,
but we are also a bit reluctant to have difference between
linux-firmware package in our system and upstream linux-firmware
git tree. Could you post just board-2.bin changes upstream soon ?

Stanislaw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
