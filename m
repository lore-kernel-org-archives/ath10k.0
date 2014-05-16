Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlCqk-0004Zf-Bf
 for ath10k@lists.infradead.org; Fri, 16 May 2014 07:46:38 +0000
Received: by mail-wg0-f52.google.com with SMTP id l18so4577447wgh.35
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 00:46:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=pYKwhCRy8RZWFm=5mssrL=oqTsazWfkVaN2L8O6YNO3w@mail.gmail.com>
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
Date: Fri, 16 May 2014 09:46:11 +0200
Message-ID: <CACKGw+ECRrMxk4Q4Rk_PMm0WDqnyK5x9YdKSPYus_zMHxvi17Q@mail.gmail.com>
Subject: Re: RE : RE : RE : RE : ath10k: set channel by command "iw" not from
 hostapd and DFS support of firmware-2.bin_10.1.467.2-1
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

On 16 May 2014 09:35, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 16 May 2014 09:01, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:

> Seems CONFIG_ATH10K_DFS_CERTIFIED is not set.
> You can simply check this during compilation adding eg. to mac.c
> #ifndef CONFIG_ATH10K_DFS_CERTIFIED
> #error DFS_NOT_SET
> #endif
>
> I am not sure but could be if you kernel is old and didn't have this
> option (which is available in backports) then will  be not set.
> @Bartosz didn't we have same problem, do you remember how this was solved?

I assume you are using backports, right? I think I hit something
similar when I was compiling my own backports package (under openwrt).
The backports were generated from ath.git. I think the root cause for
me those days was outdated .local-symbols file from the backports and
lack of 'ATH10K_DFS_CERTIFIED=' there (I 'mixed' the original
comapt-wireless from openwrt and my own backports). But I have no idea
if you are facing something similar, since I do not know your build
setup..

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
