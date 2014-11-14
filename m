Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XpIVj-0005Pc-8S
 for ath10k@lists.infradead.org; Fri, 14 Nov 2014 15:10:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 0/2] ath10k: testmode support
References: <20140910152136.12610.18499.stgit@potku.adurom.net>
 <87zje528im.fsf@kamboji.qca.qualcomm.com>
 <CAD1M061Gky-a28Rokmgyd-5x_m_h1SNmj9ZxUd4v1fP=bae35g@mail.gmail.com>
Date: Fri, 14 Nov 2014 17:09:21 +0200
In-Reply-To: <CAD1M061Gky-a28Rokmgyd-5x_m_h1SNmj9ZxUd4v1fP=bae35g@mail.gmail.com>
 (Pushpal Sidhu's message of "Thu, 13 Nov 2014 16:08:30 -0800")
Message-ID: <87389lstst.fsf@kamboji.qca.qualcomm.com>
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Pushpal Sidhu <psidhu@gateworks.com> writes:

> On Thu, Sep 11, 2014 at 1:43 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>>
>>> latest version of my testmode patches. Getting closer, more or less cosmetic
>>> changes this time :)
>
> While looking through this patchset (sorry it took two months), I have
> to wonder: what's this utf.bin blob? It seems in order to use
> testmode, we need this binary blob that I can't seem to find (I looked
> in linux-firmware and https://github.com/kvalo/ath10k-firmware). If,
> for whatever reason, this binary blob is not releasable, what's the
> point of adding in testmode to this driver?

testmode is for functionality needed in the factory, it's not meant for
normal users. That's why all distros should have CONFIG_NL80211_TESTMODE
disabled.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
