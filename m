Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjfge-0007tZ-HH
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 04:51:13 +0000
From: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix rfc1042 header retrieval in QCA4019 with eth
 decap mode
Date: Tue, 13 Sep 2016 04:50:43 +0000
Message-ID: <57D78591.9050107@qti.qualcomm.com>
References: <1469623085-13942-1-git-send-email-vthiagar@qti.qualcomm.com>
 <87fup5m8x5.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fup5m8x5.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <A6A90CE81C374C4AAABB127849BE6369@qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Monday 12 September 2016 09:01 PM, Valo, Kalle wrote:
> Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:
>
>> Chipset from QCA99X0 onwards (QCA99X0, QCA9984, QCA4019 & future)
>> rx_hdr_status is not padded to align in 4-byte boundary. Define a
>> new hw_params field to handle different alignment behaviour between
>> different hw. This patch fixes improper retrieval of rfc1042 header
>> with QCA4019. This patch along with "ath10k: Properly remove padding
>> from the start of rx payload" will fix traffic failure in ethernet
>> decap mode for QCA4019.
>>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>
> There were some conflicts, I fixed them in the pending branch. Please
> check my changes:
>
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d0d9e40216e1a8edd2f3b387b96aad62c3a49add
>

Looks fine, thanks.

Vasanth
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
