Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLPBw-0004Qd-W8
 for ath10k@lists.infradead.org; Tue, 30 Apr 2019 09:36:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: add peer id check in ath10k_peer_find_by_id
References: <1554260478-4161-1-git-send-email-wgong@codeaurora.org>
 <CANMq1KAU1B4Bweq3O6O8HOMwT7fHjj9tDyxqMsn_vn4gwxXL=Q@mail.gmail.com>
Date: Tue, 30 Apr 2019 12:36:41 +0300
In-Reply-To: <CANMq1KAU1B4Bweq3O6O8HOMwT7fHjj9tDyxqMsn_vn4gwxXL=Q@mail.gmail.com>
 (Nicolas Boichat's message of "Mon, 29 Apr 2019 18:30:00 +0800")
Message-ID: <87wojbrg0m.fsf@kamboji.qca.qualcomm.com>
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
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Claire Chang <tientzu@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Nicolas Boichat <drinkcat@chromium.org> writes:

> On Wed, Apr 3, 2019 at 3:01 AM Wen Gong <wgong@codeaurora.org> wrote:
>>
>> For some SDIO chip, the peer id is 65535 for MPDU with error status,
>> then test_bit will trigger buffer overflow for peer's memory, if kasan
>> enabled, it will report error.
>>
>> Add check for overflow the size of peer's peer_ids will avoid the buffer
>> overflow access.
>>

[...]

>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>> @@ -157,6 +157,9 @@ struct ath10k_peer *ath10k_peer_find_by_id(struct ath10k *ar, int peer_id)
>>  {
>>         struct ath10k_peer *peer;
>>
>> +       if (peer_id >= sizeof(peer->peer_ids) * BITS_PER_BYTE)
>
> I'd use >= BITS_PER_TYPE(peer->peer_ids).

Nice, I didn't know about that. Wen, please submit v2 using this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
