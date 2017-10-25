Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7HfK-0007qm-PU
 for ath10k@lists.infradead.org; Wed, 25 Oct 2017 09:08:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: rebuild crypto header in Rx data frames
Date: Wed, 25 Oct 2017 09:07:30 +0000
Message-ID: <87d15boasv.fsf@qca.qualcomm.com>
References: <1508867652-16199-1-git-send-email-kvalo@qca.qualcomm.com>
 <720ce165-4a06-1d6e-6158-7983d75eea8a@dd-wrt.com>
 <CAGyitvNvCFAfuRg=uKLvZeZVzxsQ14GeXR702FHwu+RLLE_WAQ@mail.gmail.com>
In-Reply-To: <CAGyitvNvCFAfuRg=uKLvZeZVzxsQ14GeXR702FHwu+RLLE_WAQ@mail.gmail.com>	(Jasmine
 Strong's message of "Tue, 24 Oct 2017 14:15:22 -0700")
Content-Language: en-US
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
To: Jasmine Strong <jas@eero.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

(fixing top posting)

Jasmine Strong <jas@eero.com> writes:

> On Tue, Oct 24, 2017 at 1:41 PM, Sebastian Gottschall
> <s.gottschall@dd-wrt.com> wrote:
>
>> patch works. tested in sta and ap mode so far on 9984
>
> Seems to work okay on mixed networks of 9882, 4019 and 9888.

Thanks Sebastian and Jasmine for testing this, very much appreciated. We
have a v3 coming up soon which should fix GCMP, GCMP-256 and CCMP-256 as
well.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
