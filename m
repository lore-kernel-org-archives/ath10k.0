Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xp4S2-0005Uy-Dw
 for ath10k@lists.infradead.org; Fri, 14 Nov 2014 00:09:22 +0000
Received: by mail-ob0-f171.google.com with SMTP id wp18so11903223obc.30
 for <ath10k@lists.infradead.org>; Thu, 13 Nov 2014 16:09:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87zje528im.fsf@kamboji.qca.qualcomm.com>
References: <20140910152136.12610.18499.stgit@potku.adurom.net>
 <87zje528im.fsf@kamboji.qca.qualcomm.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 13 Nov 2014 16:08:30 -0800
Message-ID: <CAD1M061Gky-a28Rokmgyd-5x_m_h1SNmj9ZxUd4v1fP=bae35g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ath10k: testmode support
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Sep 11, 2014 at 1:43 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>
>> latest version of my testmode patches. Getting closer, more or less cosmetic
>> changes this time :)

While looking through this patchset (sorry it took two months), I have
to wonder: what's this utf.bin blob? It seems in order to use
testmode, we need this binary blob that I can't seem to find (I looked
in linux-firmware and https://github.com/kvalo/ath10k-firmware). If,
for whatever reason, this binary blob is not releasable, what's the
point of adding in testmode to this driver?

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
