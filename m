Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buJlP-0002FI-G3
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 13:40:08 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Latest stable ath10k driver
Date: Wed, 12 Oct 2016 13:39:42 +0000
Message-ID: <87a8e9fzz6.fsf@kamboji.qca.qualcomm.com>
References: <BN6PR10MB187530D8C562B6878B2C2C6491C40@BN6PR10MB1875.namprd10.prod.outlook.com>
In-Reply-To: <BN6PR10MB187530D8C562B6878B2C2C6491C40@BN6PR10MB1875.namprd10.prod.outlook.com>
 (George Bonev's message of "Wed, 5 Oct 2016 16:38:46 +0000")
Content-Language: en-US
Content-ID: <A58690336B56E0499FE7569017F1288A@qualcomm.com>
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
To: "Bonev, George" <George.Bonev@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Bonev, George" <George.Bonev@spirent.com> writes:

> Hi,
> I am looking for the latest stable version of the ath10k driver.
>
> Right now I am using v4.4.2 I downloaded from here:
> https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/
> I am rebuilding ath10k driver against my old kernel.
>
> Is there a TAG that represents a stable version in git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ?

Best to use official Linux releases (v4.7, v4.8 and so on). If you want,
you can in addition use Linus stable releases (4.8.1 etc). There are no
separate releases for ath10k, if that's what you are asking.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
