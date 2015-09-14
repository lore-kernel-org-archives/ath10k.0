Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbOUO-0008Vy-4r
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 07:47:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4.3] ath10k: fix DMA related firmware crashes on multiple
 devices
References: <1442176540-34973-1-git-send-email-nbd@openwrt.org>
 <87si6h1o4q.fsf@kamboji.qca.qualcomm.com>
 <55F6733B.9030106@openwrt.org>
Date: Mon, 14 Sep 2015 10:46:59 +0300
In-Reply-To: <55F6733B.9030106@openwrt.org> (Felix Fietkau's message of "Mon, 
 14 Sep 2015 09:11:55 +0200")
Message-ID: <87k2rt1lzg.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

> On 2015-09-14 09:00, Kalle Valo wrote:
>> Felix Fietkau <nbd@openwrt.org> writes:
>> 
>>> Some platforms really don't like DMA bursts of 256 bytes, and this
>>> causes the firmware to crash when sending beacons.
>>> Also, changing this based on the firmware version does not seem to make
>>> much sense, so use 128 bytes for all versions.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
>> 
>> Nice, good catch! Just to make sure, this fixes the issues some people
>> have reported that 10.1 firmware works but 10.2 firmware crashes when
>> starting beaconing?
>
> Yes. I was able to reproduce that issue myself on a Gateworks Laguna
> device, which is among the affected devices reported in that email
> thread. This patch fixes it for me.

Awesome. Can you please resend this and CC ath10k@lists.infradead.org
(as well as linux-wireless) so that I get this to the correct patchwork
project? I'll then send it forward to 4.3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
