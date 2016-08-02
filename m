Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUXaz-0007PC-2m
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 11:10:50 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
Date: Tue, 2 Aug 2016 11:10:22 +0000
Message-ID: <874m738m02.fsf@kamboji.qca.qualcomm.com>
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
 <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
 <20160721080541.GB2658@redhat.com> <5790A28F.8030102@redhat.com>
 <20160721115122.GA31869@redhat.com>
 <a264e995-fc46-7fcd-69f9-80992385b6b1@broadcom.com>
 <20160722102559.GA2662@redhat.com>	<20160722221523.GM5537@wotan.suse.de>
In-Reply-To: <20160722221523.GM5537@wotan.suse.de> (Luis R. Rodriguez's
 message of "Sat, 23 Jul 2016 00:15:23 +0200")
Content-Language: en-US
Content-ID: <CD4ACF740DAFA747B47366387453E392@qualcomm.com>
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
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Prarit Bhargava <prarit@redhat.com>, Arend Van Spriel <arend.vanspriel@broadcom.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, "mmarek@suse.com" <mmarek@suse.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Arend van Spriel <arend@broadcom.com>, Emmanuel Grumbach <egrumbach@gmail.com>

"Luis R. Rodriguez" <mcgrof@kernel.org> writes:

> I was considering this as a future extension to the firmware API
> through the new extensible firmware API, the sysdata API.

I think Linus mentioned this already, but I want to reiterate anyway.
The name "sysdata" is horrible, I didn't have any idea what it means
until I read your description. Please continue to use the term
"firmware", anyone already know what it means.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
