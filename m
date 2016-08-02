Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUXj3-0007AD-Nb
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 11:19:10 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
Date: Tue, 2 Aug 2016 11:18:15 +0000
Message-ID: <87ziov772h.fsf@kamboji.qca.qualcomm.com>
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 19 Jul 2016 15:00:37 +0200")
Content-Language: en-US
Content-ID: <63A4BEE48DA0F544ACC688595CCB1353@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware files are versioned to prevent older
> driver instances to load unsupported firmware
> blobs. This is reflected with a fallback logic
> which attempts to load several firmware files.
>
> This however produced a lot of unnecessary
> warnings sometimes confusing users and leading
> them to rename firmware files making things even
> more confusing.
>
> Hence use request_firmware_direct() which does not
> produce extra warnings. This shouldn't really
> break anything because most modern systems don't
> rely on udev/hotplug helpers to load firmware
> files anymore.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Nice. These "firmware not found" messages have been confusing ath10k
users for ages and should be properly fixed. I hope we find a solution.

But I talked with Felix about this and he made a good point about board
and calibration files. Calibration files might be created runtime, for
example retrieved from NAND etc, and this might break the use case when
ath10k is statically linked to kernel. Is the combination used in real
life and should we care, that I do not know, but I'm worried of possible
regressions. I guess LEDE/openwrt always loads ath10k as a module and
after the calibration file is created?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
