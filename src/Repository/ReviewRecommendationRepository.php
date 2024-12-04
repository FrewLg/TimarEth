<?php

namespace App\Repository;

use App\Entity\ReviewRecommendation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ReviewRecommendation>
 *
 * @method ReviewRecommendation|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReviewRecommendation|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReviewRecommendation[]    findAll()
 * @method ReviewRecommendation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReviewRecommendationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReviewRecommendation::class);
    }

    //    /**
    //     * @return ReviewRecommendation[] Returns an array of ReviewRecommendation objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?ReviewRecommendation
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
