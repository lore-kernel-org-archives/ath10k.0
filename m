Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIkD-0007ma-3w
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:04:20 +0000
Received: by mail-lb0-f175.google.com with SMTP id l4so1975847lbv.34
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 07:03:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oayx6fp7.fsf@kamboji.qca.qualcomm.com>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
 <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
 <CALhHN=pYKwhCRy8RZWFm=5mssrL=oqTsazWfkVaN2L8O6YNO3w@mail.gmail.com>
 <87oayx6fp7.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 16 May 2014 16:03:53 +0200
Message-ID: <CALhHN=reP0gh+xbcRKc4gj4Edhs7V4Y5Eef=BLK3YP43v2p7Mw@mail.gmail.com>
Subject: Re: RE : RE : RE : RE : ath10k: set channel by command "iw" not from
 hostapd and DFS support of firmware-2.bin_10.1.467.2-1
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

On 16 May 2014 15:00, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Seems CONFIG_ATH10K_DFS_CERTIFIED is not set.
>> You can simply check this during compilation adding eg. to mac.c
>> #ifndef CONFIG_ATH10K_DFS_CERTIFIED
>> #error DFS_NOT_SET
>> #endif
>
> This reminds me of a feature I have been thinking. We really should have
> an info print of what ath10k kconfig options are enabled in the build.
> For example something like this:
>
> ath10k: debug off debugfs on tracing off dfs on
>
> Patches welcome :)

I can add this, but question here is what *.c file should I use -
mac.c looks fine, but still someone can set flags only for some files
and for some files not.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
