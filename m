Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJl9f-00062L-EF
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 15:16:59 +0000
Message-ID: <53F36A4F.5050505@candelatech.com>
Date: Tue, 19 Aug 2014 08:16:31 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 3/8] ath10k: save firmware debug log messages
References: <20140819082038.16842.46876.stgit@potku.adurom.net>	<20140819082300.16842.40769.stgit@potku.adurom.net>	<CA+BoTQmubLrvB1LHquFDNf8W06vePvEk6K3aNV9ngCAAXemY6w@mail.gmail.com>
 <CA+BoTQ=UduqFY6G=sXJR43hQWk-4v09uYvYJYKO7EGuea7L-Xg@mail.gmail.com>
In-Reply-To: <CA+BoTQ=UduqFY6G=sXJR43hQWk-4v09uYvYJYKO7EGuea7L-Xg@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


>>> +       spin_lock_bh(&ar->data_lock);
>>> +
>>> +       /* First 4 bytes are a messages-dropped-due-to-overflow counter,
>>> +        * and should not be recorded in the dbglog buffer, so we skip
>>> +        * them.
>>> +        */
>>> +       ath10k_debug_dbglog_add(ar, skb->data + 4, skb->len - 4);
>
> Can't we just:
>
> struct wmi_dbg_msg {
>    __le32 num_dropped_due_to_overflow;
>    u8 payload[0]; // is this an array of u8 or __le32 actually?
> };

When I wrote this, I was more paranoid about exposing
any possible details of firmware.  It is an array of 32-bit ints in firmware,
and it decodes as ints instead of bytes, so probably u32 payload instead of u8.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
