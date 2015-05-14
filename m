Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ysuos-0003Lp-Co
 for ath10k@lists.infradead.org; Thu, 14 May 2015 15:13:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k/mac80211: add rawtxrx,
 nohwcrypt module param for raw tx injection, sw crypto support.
References: <CAG5N3qG7090vB6XoUaQSHvQw7GpE+gXvJAbKrv7def3nV0OFJw@mail.gmail.com>
 <873837qo6l.fsf@kamboji.qca.qualcomm.com>
 <554CE438.5000208@candelatech.com>
 <CAG5N3qFB=yZJYSokUqF2=eNcS5SoCOntOyan6_OuahtFF5r=Bw@mail.gmail.com>
 <871tinjosq.fsf@kamboji.qca.qualcomm.com>
 <5550D629.2090501@candelatech.com>
 <CAG5N3qE6nA2oEhR5Zk8sS331-ycM+jZLBy2BeGPX0ueHqvJ6Kg@mail.gmail.com>
Date: Thu, 14 May 2015 18:12:36 +0300
In-Reply-To: <CAG5N3qE6nA2oEhR5Zk8sS331-ycM+jZLBy2BeGPX0ueHqvJ6Kg@mail.gmail.com>
 (Liu CF's message of "Tue, 12 May 2015 15:44:29 -0700")
Message-ID: <87oalnchwb.fsf@kamboji.qca.qualcomm.com>
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
To: Liu CF/TW <cfliu.tw@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Liu CF/TW" <cfliu.tw@gmail.com> writes:

> I am going to propose just one single module parameter control: enc_mode
>
> - enc_mode = 0: Use HW crypto (default),
>
>   Driver behavior:
>      - ath10k driver uses native WiFi mode for both Tx/Rx.
>      - ath10k driver configures key to HW.
>      Given HW key descriptor is configured, mac80211 would offload Tx
> encryption to HW and only do Rx decryption (by mac80211) if HW failed
> to do it.

But isn't the point here to use 802.11 frames ("raw mode")? Then why
name the module paramater as enc_mode? I think that's confusing.

And to me enc_mode doesn't tell much, my first thought was "encoding
mode". Wouldn't cryptmode tell more to the user?


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
