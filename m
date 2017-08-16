Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhzWk-0003uC-MW
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 14:42:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
Date: Wed, 16 Aug 2017 14:42:09 +0000
Message-ID: <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
In-Reply-To: <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>	(Gilbert
 Moisio's message of "Wed, 16 Aug 2017 16:24:11 +0200")
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
To: Gilbert Moisio <gmoisio@gmail.com>
Cc: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

(please don't top post)

Gilbert Moisio <gmoisio@gmail.com> writes:

> I tried from a fresh install, directly with the last linux-firmware
> package and the issue in avaliable at the first boot.

That does not answer my question if it's WPA rekeying related but let's
forget that for now.

Can you try this firmware:

https://github.com/kvalo/ath10k-firmware/blob/master/QCA6174/hw3.0/4.4.1/firmware-6.bin_WLAN.RM.4.4.1-00026-QCARMSWP-1

If you try it, double check that you are really testing the correct
firmware version, it's pretty easy to use the wrong version. Even better
if you can provide me the desmg output so that I can confirm that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
