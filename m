Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ef6XM-0000wi-8L
 for ath10k@lists.infradead.org; Fri, 26 Jan 2018 16:07:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add OpenMesh A42 specific BDFs
Date: Fri, 26 Jan 2018 16:07:10 +0000
Message-ID: <874ln8txhu.fsf@kamboji.qca.qualcomm.com>
References: <6906010.WJMafUttCS@bentobox>
In-Reply-To: <6906010.WJMafUttCS@bentobox> (Sven Eckelmann's message of "Tue, 
 28 Nov 2017 15:45:52 +0100")
Content-Language: en-US
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Christian Lamparter <chunkeey@gmail.com>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> Hi,
>
> I am currently trying to integrate the OpenMesh A42 support in LEDE [1]. This 
> AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The 
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> QCA doesn't provide special IDs for customers and seems to use the AP-DK
> board-ids in the wifi firmware to change its behavior. But we've already
> proposed a patch to work around this kind of problem [2].
>
> The name of the files are equal to the id string in the board-2.bin (minus the 
> ".bin"):
>
> * bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42
>   - sha256sum: 
>     10700a7ac636d57fe055e5bb4bd5f7bb3f1c282a7f25a8bb2204fc36e8c317bf
> * bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42
>   - sha256sum:
>     b3d9556894e509ac608b2e27c9169da12c63634670bb69c5ef21fb31583e7998

I added these now:

https://github.com/kvalo/ath10k-firmware/commit/5cd2bacd8e22217335e539b416d0cb8d59f8e312

To make this easier I did some bigger changes in ath10k-bdencoder,
please check carefully that I didn't break anything.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
