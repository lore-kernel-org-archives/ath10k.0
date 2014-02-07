Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBfqL-0005rJ-8e
 for ath10k@lists.infradead.org; Fri, 07 Feb 2014 07:27:22 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so965515bkb.28
 for <ath10k@lists.infradead.org>; Thu, 06 Feb 2014 23:26:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj984TssetDfG=3FnvZhJVxsoYKba+ppoV4nV=R9psfs5B8g@mail.gmail.com>
References: <1391676841-11107-1-git-send-email-michal.kazior@tieto.com>
 <CAEFj984TssetDfG=3FnvZhJVxsoYKba+ppoV4nV=R9psfs5B8g@mail.gmail.com>
Date: Fri, 7 Feb 2014 08:26:56 +0100
Message-ID: <CA+BoTQkhKYa6O3ydVZfCA1k-qihWjUTUJ7JmyBxfxUweVAMZTA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement sta_rc_update()
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6 February 2014 19:09, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> @@ -3091,6 +3160,10 @@ static int ath10k_sta_state(struct ieee80211_hw *=
hw,
>>                            "mac vdev %d peer create %pM (new sta) num_pe=
ers %d\n",
>>                            arvif->vdev_id, sta->addr, ar->num_peers);
>>
>> +               memset(&arsta, 0, sizeof(*arsta));
>
> Should be memset(arsta, 0, sizeof(*arsta)), right?

Hmm, I must've sent the old patch because I remember fixing this
already. Anyway - thanks for catching this! I'll send a v2.


Micha=B3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
