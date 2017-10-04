Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzfKd-0006sQ-62
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 08:47:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware names
Date: Wed, 4 Oct 2017 08:46:38 +0000
Message-ID: <87h8vfxpua.fsf@kamboji.qca.qualcomm.com>
References: <CAPBk6Lwpa1SN9fp==3kkQRWMobxdtnp6b-E=T+ku68kZUUXD6Q@mail.gmail.com>
In-Reply-To: <CAPBk6Lwpa1SN9fp==3kkQRWMobxdtnp6b-E=T+ku68kZUUXD6Q@mail.gmail.com>	(Ahmet
 Ercin's message of "Fri, 22 Sep 2017 09:48:59 +0300")
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
To: Ahmet Ercin <ahmet.ercin@aurea.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ahmet Ercin <ahmet.ercin@aurea.com> writes:

> What is the meaning of "-2" at the end of firmware names ?

We call it "the firmware API version" to avoid breaking older ath10k
versions when there are backwards incompatible changes in the firmware.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware#firmware_api_versions

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
